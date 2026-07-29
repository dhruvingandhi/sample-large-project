# Explore: explore_1747
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05242.view.lkml"
include: "/views/domain_44/view_05244.view.lkml"
include: "/views/domain_45/view_05245.view.lkml"
include: "/views/domain_46/view_05246.view.lkml"

explore: explore_1747 {
  label: "Explore Explore 1747"
  description: "Comprehensive analytics explore joining base view_05242 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05242
  
  always_filter: {
    filters: [view_05242.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05242.created_at_date: "7 days"]
    unless: [view_05242.id, view_05242.status]
  }

  join: view_05244 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05242.user_id} = ${view_05244.id} ;;
    required_joins: []
  }

  join: view_05245 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05242.account_id} = ${view_05245.account_id} ;;
    required_joins: [view_05244]
  }

  join: view_05246 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05242.category} = ${view_05246.category} ;;
  }

  access_filter: {
    field: view_05242.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05242.is_deleted} = false ;;
}

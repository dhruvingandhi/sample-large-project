# Explore: explore_0747
# Auto-generated LookML Explore File

include: "/views/domain_42/view_02242.view.lkml"
include: "/views/domain_44/view_02244.view.lkml"
include: "/views/domain_45/view_02245.view.lkml"
include: "/views/domain_46/view_02246.view.lkml"

explore: explore_0747 {
  label: "Explore Explore 0747"
  description: "Comprehensive analytics explore joining base view_02242 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02242
  
  always_filter: {
    filters: [view_02242.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02242.created_at_date: "7 days"]
    unless: [view_02242.id, view_02242.status]
  }

  join: view_02244 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02242.user_id} = ${view_02244.id} ;;
    required_joins: []
  }

  join: view_02245 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02242.account_id} = ${view_02245.account_id} ;;
    required_joins: [view_02244]
  }

  join: view_02246 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02242.category} = ${view_02246.category} ;;
  }

  access_filter: {
    field: view_02242.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02242.is_deleted} = false ;;
}

# Explore: explore_2747
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08242.view.lkml"
include: "/views/domain_44/view_08244.view.lkml"
include: "/views/domain_45/view_08245.view.lkml"
include: "/views/domain_46/view_08246.view.lkml"

explore: explore_2747 {
  label: "Explore Explore 2747"
  description: "Comprehensive analytics explore joining base view_08242 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08242
  
  always_filter: {
    filters: [view_08242.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08242.created_at_date: "7 days"]
    unless: [view_08242.id, view_08242.status]
  }

  join: view_08244 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08242.user_id} = ${view_08244.id} ;;
    required_joins: []
  }

  join: view_08245 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08242.account_id} = ${view_08245.account_id} ;;
    required_joins: [view_08244]
  }

  join: view_08246 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08242.category} = ${view_08246.category} ;;
  }

  access_filter: {
    field: view_08242.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08242.is_deleted} = false ;;
}

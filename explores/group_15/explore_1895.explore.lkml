# Explore: explore_1895
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05686.view.lkml"
include: "/views/domain_38/view_05688.view.lkml"
include: "/views/domain_39/view_05689.view.lkml"
include: "/views/domain_40/view_05690.view.lkml"

explore: explore_1895 {
  label: "Explore Explore 1895"
  description: "Comprehensive analytics explore joining base view_05686 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05686
  
  always_filter: {
    filters: [view_05686.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05686.created_at_date: "7 days"]
    unless: [view_05686.id, view_05686.status]
  }

  join: view_05688 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05686.user_id} = ${view_05688.id} ;;
    required_joins: []
  }

  join: view_05689 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05686.account_id} = ${view_05689.account_id} ;;
    required_joins: [view_05688]
  }

  join: view_05690 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05686.category} = ${view_05690.category} ;;
  }

  access_filter: {
    field: view_05686.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05686.is_deleted} = false ;;
}

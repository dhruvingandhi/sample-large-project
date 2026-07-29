# Explore: explore_2994
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08983.view.lkml"
include: "/views/domain_35/view_08985.view.lkml"
include: "/views/domain_36/view_08986.view.lkml"
include: "/views/domain_37/view_08987.view.lkml"

explore: explore_2994 {
  label: "Explore Explore 2994"
  description: "Comprehensive analytics explore joining base view_08983 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08983
  
  always_filter: {
    filters: [view_08983.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08983.created_at_date: "7 days"]
    unless: [view_08983.id, view_08983.status]
  }

  join: view_08985 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08983.user_id} = ${view_08985.id} ;;
    required_joins: []
  }

  join: view_08986 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08983.account_id} = ${view_08986.account_id} ;;
    required_joins: [view_08985]
  }

  join: view_08987 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08983.category} = ${view_08987.category} ;;
  }

  access_filter: {
    field: view_08983.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08983.is_deleted} = false ;;
}

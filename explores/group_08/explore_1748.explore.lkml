# Explore: explore_1748
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05245.view.lkml"
include: "/views/domain_47/view_05247.view.lkml"
include: "/views/domain_48/view_05248.view.lkml"
include: "/views/domain_49/view_05249.view.lkml"

explore: explore_1748 {
  label: "Explore Explore 1748"
  description: "Comprehensive analytics explore joining base view_05245 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05245
  
  always_filter: {
    filters: [view_05245.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05245.created_at_date: "7 days"]
    unless: [view_05245.id, view_05245.status]
  }

  join: view_05247 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05245.user_id} = ${view_05247.id} ;;
    required_joins: []
  }

  join: view_05248 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05245.account_id} = ${view_05248.account_id} ;;
    required_joins: [view_05247]
  }

  join: view_05249 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05245.category} = ${view_05249.category} ;;
  }

  access_filter: {
    field: view_05245.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05245.is_deleted} = false ;;
}

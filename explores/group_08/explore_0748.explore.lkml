# Explore: explore_0748
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02245.view.lkml"
include: "/views/domain_47/view_02247.view.lkml"
include: "/views/domain_48/view_02248.view.lkml"
include: "/views/domain_49/view_02249.view.lkml"

explore: explore_0748 {
  label: "Explore Explore 0748"
  description: "Comprehensive analytics explore joining base view_02245 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02245
  
  always_filter: {
    filters: [view_02245.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02245.created_at_date: "7 days"]
    unless: [view_02245.id, view_02245.status]
  }

  join: view_02247 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02245.user_id} = ${view_02247.id} ;;
    required_joins: []
  }

  join: view_02248 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02245.account_id} = ${view_02248.account_id} ;;
    required_joins: [view_02247]
  }

  join: view_02249 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02245.category} = ${view_02249.category} ;;
  }

  access_filter: {
    field: view_02245.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02245.is_deleted} = false ;;
}

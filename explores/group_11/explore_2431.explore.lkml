# Explore: explore_2431
# Auto-generated LookML Explore File

include: "/views/domain_44/view_07294.view.lkml"
include: "/views/domain_46/view_07296.view.lkml"
include: "/views/domain_47/view_07297.view.lkml"
include: "/views/domain_48/view_07298.view.lkml"

explore: explore_2431 {
  label: "Explore Explore 2431"
  description: "Comprehensive analytics explore joining base view_07294 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07294
  
  always_filter: {
    filters: [view_07294.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07294.created_at_date: "7 days"]
    unless: [view_07294.id, view_07294.status]
  }

  join: view_07296 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07294.user_id} = ${view_07296.id} ;;
    required_joins: []
  }

  join: view_07297 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07294.account_id} = ${view_07297.account_id} ;;
    required_joins: [view_07296]
  }

  join: view_07298 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07294.category} = ${view_07298.category} ;;
  }

  access_filter: {
    field: view_07294.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07294.is_deleted} = false ;;
}

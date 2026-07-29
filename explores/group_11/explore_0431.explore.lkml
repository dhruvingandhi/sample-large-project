# Explore: explore_0431
# Auto-generated LookML Explore File

include: "/views/domain_44/view_01294.view.lkml"
include: "/views/domain_46/view_01296.view.lkml"
include: "/views/domain_47/view_01297.view.lkml"
include: "/views/domain_48/view_01298.view.lkml"

explore: explore_0431 {
  label: "Explore Explore 0431"
  description: "Comprehensive analytics explore joining base view_01294 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01294
  
  always_filter: {
    filters: [view_01294.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01294.created_at_date: "7 days"]
    unless: [view_01294.id, view_01294.status]
  }

  join: view_01296 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01294.user_id} = ${view_01296.id} ;;
    required_joins: []
  }

  join: view_01297 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01294.account_id} = ${view_01297.account_id} ;;
    required_joins: [view_01296]
  }

  join: view_01298 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01294.category} = ${view_01298.category} ;;
  }

  access_filter: {
    field: view_01294.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01294.is_deleted} = false ;;
}

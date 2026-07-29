# Explore: explore_0426
# Auto-generated LookML Explore File

include: "/views/domain_29/view_01279.view.lkml"
include: "/views/domain_31/view_01281.view.lkml"
include: "/views/domain_32/view_01282.view.lkml"
include: "/views/domain_33/view_01283.view.lkml"

explore: explore_0426 {
  label: "Explore Explore 0426"
  description: "Comprehensive analytics explore joining base view_01279 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01279
  
  always_filter: {
    filters: [view_01279.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01279.created_at_date: "7 days"]
    unless: [view_01279.id, view_01279.status]
  }

  join: view_01281 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01279.user_id} = ${view_01281.id} ;;
    required_joins: []
  }

  join: view_01282 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01279.account_id} = ${view_01282.account_id} ;;
    required_joins: [view_01281]
  }

  join: view_01283 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01279.category} = ${view_01283.category} ;;
  }

  access_filter: {
    field: view_01279.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01279.is_deleted} = false ;;
}

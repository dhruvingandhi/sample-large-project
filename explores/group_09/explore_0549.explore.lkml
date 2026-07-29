# Explore: explore_0549
# Auto-generated LookML Explore File

include: "/views/domain_48/view_01648.view.lkml"
include: "/views/domain_50/view_01650.view.lkml"
include: "/views/domain_01/view_01651.view.lkml"
include: "/views/domain_02/view_01652.view.lkml"

explore: explore_0549 {
  label: "Explore Explore 0549"
  description: "Comprehensive analytics explore joining base view_01648 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01648
  
  always_filter: {
    filters: [view_01648.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01648.created_at_date: "7 days"]
    unless: [view_01648.id, view_01648.status]
  }

  join: view_01650 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01648.user_id} = ${view_01650.id} ;;
    required_joins: []
  }

  join: view_01651 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01648.account_id} = ${view_01651.account_id} ;;
    required_joins: [view_01650]
  }

  join: view_01652 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01648.category} = ${view_01652.category} ;;
  }

  access_filter: {
    field: view_01648.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01648.is_deleted} = false ;;
}

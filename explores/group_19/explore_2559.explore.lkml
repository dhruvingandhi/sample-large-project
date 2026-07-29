# Explore: explore_2559
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07678.view.lkml"
include: "/views/domain_30/view_07680.view.lkml"
include: "/views/domain_31/view_07681.view.lkml"
include: "/views/domain_32/view_07682.view.lkml"

explore: explore_2559 {
  label: "Explore Explore 2559"
  description: "Comprehensive analytics explore joining base view_07678 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07678
  
  always_filter: {
    filters: [view_07678.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07678.created_at_date: "7 days"]
    unless: [view_07678.id, view_07678.status]
  }

  join: view_07680 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07678.user_id} = ${view_07680.id} ;;
    required_joins: []
  }

  join: view_07681 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07678.account_id} = ${view_07681.account_id} ;;
    required_joins: [view_07680]
  }

  join: view_07682 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07678.category} = ${view_07682.category} ;;
  }

  access_filter: {
    field: view_07678.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07678.is_deleted} = false ;;
}

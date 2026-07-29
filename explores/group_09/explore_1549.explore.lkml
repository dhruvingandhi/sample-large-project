# Explore: explore_1549
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04648.view.lkml"
include: "/views/domain_50/view_04650.view.lkml"
include: "/views/domain_01/view_04651.view.lkml"
include: "/views/domain_02/view_04652.view.lkml"

explore: explore_1549 {
  label: "Explore Explore 1549"
  description: "Comprehensive analytics explore joining base view_04648 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04648
  
  always_filter: {
    filters: [view_04648.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04648.created_at_date: "7 days"]
    unless: [view_04648.id, view_04648.status]
  }

  join: view_04650 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04648.user_id} = ${view_04650.id} ;;
    required_joins: []
  }

  join: view_04651 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04648.account_id} = ${view_04651.account_id} ;;
    required_joins: [view_04650]
  }

  join: view_04652 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04648.category} = ${view_04652.category} ;;
  }

  access_filter: {
    field: view_04648.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04648.is_deleted} = false ;;
}

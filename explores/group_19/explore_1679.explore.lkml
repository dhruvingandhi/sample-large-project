# Update for 2000 file diff target
# Explore: explore_1679
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05038.view.lkml"
include: "/views/domain_40/view_05040.view.lkml"
include: "/views/domain_41/view_05041.view.lkml"
include: "/views/domain_42/view_05042.view.lkml"

explore: explore_1679 {
  label: "Explore Explore 1679"
  description: "Comprehensive analytics explore joining base view_05038 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05038
  
  always_filter: {
    filters: [view_05038.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05038.created_at_date: "7 days"]
    unless: [view_05038.id, view_05038.status]
  }

  join: view_05040 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05038.user_id} = ${view_05040.id} ;;
    required_joins: []
  }

  join: view_05041 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05038.account_id} = ${view_05041.account_id} ;;
    required_joins: [view_05040]
  }

  join: view_05042 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05038.category} = ${view_05042.category} ;;
  }

  access_filter: {
    field: view_05038.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05038.is_deleted} = false ;;
}

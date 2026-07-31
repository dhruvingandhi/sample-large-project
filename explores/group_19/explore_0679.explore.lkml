# Update for 2000 file diff target
# Explore: explore_0679
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02038.view.lkml"
include: "/views/domain_40/view_02040.view.lkml"
include: "/views/domain_41/view_02041.view.lkml"
include: "/views/domain_42/view_02042.view.lkml"

explore: explore_0679 {
  label: "Explore Explore 0679"
  description: "Comprehensive analytics explore joining base view_02038 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02038
  
  always_filter: {
    filters: [view_02038.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02038.created_at_date: "7 days"]
    unless: [view_02038.id, view_02038.status]
  }

  join: view_02040 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02038.user_id} = ${view_02040.id} ;;
    required_joins: []
  }

  join: view_02041 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02038.account_id} = ${view_02041.account_id} ;;
    required_joins: [view_02040]
  }

  join: view_02042 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02038.category} = ${view_02042.category} ;;
  }

  access_filter: {
    field: view_02038.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02038.is_deleted} = false ;;
}

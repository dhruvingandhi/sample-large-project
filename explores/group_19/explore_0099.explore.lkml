# Update for 2000 file diff target
# Explore: explore_0099
# Auto-generated LookML Explore File

include: "/views/domain_48/view_00298.view.lkml"
include: "/views/domain_50/view_00300.view.lkml"
include: "/views/domain_01/view_00301.view.lkml"
include: "/views/domain_02/view_00302.view.lkml"

explore: explore_0099 {
  label: "Explore Explore 0099"
  description: "Comprehensive analytics explore joining base view_00298 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00298
  
  always_filter: {
    filters: [view_00298.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00298.created_at_date: "7 days"]
    unless: [view_00298.id, view_00298.status]
  }

  join: view_00300 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00298.user_id} = ${view_00300.id} ;;
    required_joins: []
  }

  join: view_00301 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00298.account_id} = ${view_00301.account_id} ;;
    required_joins: [view_00300]
  }

  join: view_00302 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00298.category} = ${view_00302.category} ;;
  }

  access_filter: {
    field: view_00298.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00298.is_deleted} = false ;;
}

# Update for 2000 file diff target
# Explore: explore_0059
# Auto-generated LookML Explore File

include: "/views/domain_28/view_00178.view.lkml"
include: "/views/domain_30/view_00180.view.lkml"
include: "/views/domain_31/view_00181.view.lkml"
include: "/views/domain_32/view_00182.view.lkml"

explore: explore_0059 {
  label: "Explore Explore 0059"
  description: "Comprehensive analytics explore joining base view_00178 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00178
  
  always_filter: {
    filters: [view_00178.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00178.created_at_date: "7 days"]
    unless: [view_00178.id, view_00178.status]
  }

  join: view_00180 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00178.user_id} = ${view_00180.id} ;;
    required_joins: []
  }

  join: view_00181 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00178.account_id} = ${view_00181.account_id} ;;
    required_joins: [view_00180]
  }

  join: view_00182 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00178.category} = ${view_00182.category} ;;
  }

  access_filter: {
    field: view_00178.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00178.is_deleted} = false ;;
}

# Update for 2000 file diff target
# Explore: explore_0439
# Auto-generated LookML Explore File

include: "/views/domain_18/view_01318.view.lkml"
include: "/views/domain_20/view_01320.view.lkml"
include: "/views/domain_21/view_01321.view.lkml"
include: "/views/domain_22/view_01322.view.lkml"

explore: explore_0439 {
  label: "Explore Explore 0439"
  description: "Comprehensive analytics explore joining base view_01318 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01318
  
  always_filter: {
    filters: [view_01318.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01318.created_at_date: "7 days"]
    unless: [view_01318.id, view_01318.status]
  }

  join: view_01320 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01318.user_id} = ${view_01320.id} ;;
    required_joins: []
  }

  join: view_01321 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01318.account_id} = ${view_01321.account_id} ;;
    required_joins: [view_01320]
  }

  join: view_01322 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01318.category} = ${view_01322.category} ;;
  }

  access_filter: {
    field: view_01318.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01318.is_deleted} = false ;;
}

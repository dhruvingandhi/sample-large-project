# Explore: explore_0374
# Auto-generated LookML Explore File

include: "/views/domain_23/view_01123.view.lkml"
include: "/views/domain_25/view_01125.view.lkml"
include: "/views/domain_26/view_01126.view.lkml"
include: "/views/domain_27/view_01127.view.lkml"

explore: explore_0374 {
  label: "Explore Explore 0374"
  description: "Comprehensive analytics explore joining base view_01123 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01123
  
  always_filter: {
    filters: [view_01123.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01123.created_at_date: "7 days"]
    unless: [view_01123.id, view_01123.status]
  }

  join: view_01125 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01123.user_id} = ${view_01125.id} ;;
    required_joins: []
  }

  join: view_01126 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01123.account_id} = ${view_01126.account_id} ;;
    required_joins: [view_01125]
  }

  join: view_01127 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01123.category} = ${view_01127.category} ;;
  }

  access_filter: {
    field: view_01123.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01123.is_deleted} = false ;;
}

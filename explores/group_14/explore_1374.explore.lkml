# Explore: explore_1374
# Auto-generated LookML Explore File

include: "/views/domain_23/view_04123.view.lkml"
include: "/views/domain_25/view_04125.view.lkml"
include: "/views/domain_26/view_04126.view.lkml"
include: "/views/domain_27/view_04127.view.lkml"

explore: explore_1374 {
  label: "Explore Explore 1374"
  description: "Comprehensive analytics explore joining base view_04123 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04123
  
  always_filter: {
    filters: [view_04123.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04123.created_at_date: "7 days"]
    unless: [view_04123.id, view_04123.status]
  }

  join: view_04125 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04123.user_id} = ${view_04125.id} ;;
    required_joins: []
  }

  join: view_04126 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04123.account_id} = ${view_04126.account_id} ;;
    required_joins: [view_04125]
  }

  join: view_04127 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04123.category} = ${view_04127.category} ;;
  }

  access_filter: {
    field: view_04123.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04123.is_deleted} = false ;;
}

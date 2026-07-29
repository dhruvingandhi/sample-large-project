# Explore: explore_3374
# Auto-generated LookML Explore File

include: "/views/domain_23/view_10123.view.lkml"
include: "/views/domain_25/view_10125.view.lkml"
include: "/views/domain_26/view_10126.view.lkml"
include: "/views/domain_27/view_10127.view.lkml"

explore: explore_3374 {
  label: "Explore Explore 3374"
  description: "Comprehensive analytics explore joining base view_10123 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10123
  
  always_filter: {
    filters: [view_10123.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10123.created_at_date: "7 days"]
    unless: [view_10123.id, view_10123.status]
  }

  join: view_10125 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10123.user_id} = ${view_10125.id} ;;
    required_joins: []
  }

  join: view_10126 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10123.account_id} = ${view_10126.account_id} ;;
    required_joins: [view_10125]
  }

  join: view_10127 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10123.category} = ${view_10127.category} ;;
  }

  access_filter: {
    field: view_10123.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10123.is_deleted} = false ;;
}

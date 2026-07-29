# Explore: explore_2374
# Auto-generated LookML Explore File

include: "/views/domain_23/view_07123.view.lkml"
include: "/views/domain_25/view_07125.view.lkml"
include: "/views/domain_26/view_07126.view.lkml"
include: "/views/domain_27/view_07127.view.lkml"

explore: explore_2374 {
  label: "Explore Explore 2374"
  description: "Comprehensive analytics explore joining base view_07123 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07123
  
  always_filter: {
    filters: [view_07123.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07123.created_at_date: "7 days"]
    unless: [view_07123.id, view_07123.status]
  }

  join: view_07125 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07123.user_id} = ${view_07125.id} ;;
    required_joins: []
  }

  join: view_07126 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07123.account_id} = ${view_07126.account_id} ;;
    required_joins: [view_07125]
  }

  join: view_07127 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07123.category} = ${view_07127.category} ;;
  }

  access_filter: {
    field: view_07123.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07123.is_deleted} = false ;;
}

# Explore: explore_3843
# Auto-generated LookML Explore File

include: "/views/domain_30/view_11530.view.lkml"
include: "/views/domain_32/view_11532.view.lkml"
include: "/views/domain_33/view_11533.view.lkml"
include: "/views/domain_34/view_11534.view.lkml"

explore: explore_3843 {
  label: "Explore Explore 3843"
  description: "Comprehensive analytics explore joining base view_11530 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11530
  
  always_filter: {
    filters: [view_11530.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11530.created_at_date: "7 days"]
    unless: [view_11530.id, view_11530.status]
  }

  join: view_11532 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11530.user_id} = ${view_11532.id} ;;
    required_joins: []
  }

  join: view_11533 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11530.account_id} = ${view_11533.account_id} ;;
    required_joins: [view_11532]
  }

  join: view_11534 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11530.category} = ${view_11534.category} ;;
  }

  access_filter: {
    field: view_11530.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11530.is_deleted} = false ;;
}

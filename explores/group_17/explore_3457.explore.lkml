# Explore: explore_3457
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10372.view.lkml"
include: "/views/domain_24/view_10374.view.lkml"
include: "/views/domain_25/view_10375.view.lkml"
include: "/views/domain_26/view_10376.view.lkml"

explore: explore_3457 {
  label: "Explore Explore 3457"
  description: "Comprehensive analytics explore joining base view_10372 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10372
  
  always_filter: {
    filters: [view_10372.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10372.created_at_date: "7 days"]
    unless: [view_10372.id, view_10372.status]
  }

  join: view_10374 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10372.user_id} = ${view_10374.id} ;;
    required_joins: []
  }

  join: view_10375 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10372.account_id} = ${view_10375.account_id} ;;
    required_joins: [view_10374]
  }

  join: view_10376 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10372.category} = ${view_10376.category} ;;
  }

  access_filter: {
    field: view_10372.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10372.is_deleted} = false ;;
}

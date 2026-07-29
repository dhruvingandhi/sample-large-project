# Explore: explore_0873
# Auto-generated LookML Explore File

include: "/views/domain_20/view_02620.view.lkml"
include: "/views/domain_22/view_02622.view.lkml"
include: "/views/domain_23/view_02623.view.lkml"
include: "/views/domain_24/view_02624.view.lkml"

explore: explore_0873 {
  label: "Explore Explore 0873"
  description: "Comprehensive analytics explore joining base view_02620 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02620
  
  always_filter: {
    filters: [view_02620.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02620.created_at_date: "7 days"]
    unless: [view_02620.id, view_02620.status]
  }

  join: view_02622 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02620.user_id} = ${view_02622.id} ;;
    required_joins: []
  }

  join: view_02623 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02620.account_id} = ${view_02623.account_id} ;;
    required_joins: [view_02622]
  }

  join: view_02624 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02620.category} = ${view_02624.category} ;;
  }

  access_filter: {
    field: view_02620.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02620.is_deleted} = false ;;
}

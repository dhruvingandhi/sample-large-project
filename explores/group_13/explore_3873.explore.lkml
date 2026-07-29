# Explore: explore_3873
# Auto-generated LookML Explore File

include: "/views/domain_20/view_11620.view.lkml"
include: "/views/domain_22/view_11622.view.lkml"
include: "/views/domain_23/view_11623.view.lkml"
include: "/views/domain_24/view_11624.view.lkml"

explore: explore_3873 {
  label: "Explore Explore 3873"
  description: "Comprehensive analytics explore joining base view_11620 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11620
  
  always_filter: {
    filters: [view_11620.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11620.created_at_date: "7 days"]
    unless: [view_11620.id, view_11620.status]
  }

  join: view_11622 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11620.user_id} = ${view_11622.id} ;;
    required_joins: []
  }

  join: view_11623 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11620.account_id} = ${view_11623.account_id} ;;
    required_joins: [view_11622]
  }

  join: view_11624 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11620.category} = ${view_11624.category} ;;
  }

  access_filter: {
    field: view_11620.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11620.is_deleted} = false ;;
}

# Explore: explore_3510
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10531.view.lkml"
include: "/views/domain_33/view_10533.view.lkml"
include: "/views/domain_34/view_10534.view.lkml"
include: "/views/domain_35/view_10535.view.lkml"

explore: explore_3510 {
  label: "Explore Explore 3510"
  description: "Comprehensive analytics explore joining base view_10531 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10531
  
  always_filter: {
    filters: [view_10531.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10531.created_at_date: "7 days"]
    unless: [view_10531.id, view_10531.status]
  }

  join: view_10533 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10531.user_id} = ${view_10533.id} ;;
    required_joins: []
  }

  join: view_10534 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10531.account_id} = ${view_10534.account_id} ;;
    required_joins: [view_10533]
  }

  join: view_10535 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10531.category} = ${view_10535.category} ;;
  }

  access_filter: {
    field: view_10531.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10531.is_deleted} = false ;;
}

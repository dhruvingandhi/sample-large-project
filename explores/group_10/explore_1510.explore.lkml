# Update for 2000 file diff target
# Explore: explore_1510
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04531.view.lkml"
include: "/views/domain_33/view_04533.view.lkml"
include: "/views/domain_34/view_04534.view.lkml"
include: "/views/domain_35/view_04535.view.lkml"

explore: explore_1510 {
  label: "Explore Explore 1510"
  description: "Comprehensive analytics explore joining base view_04531 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04531
  
  always_filter: {
    filters: [view_04531.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04531.created_at_date: "7 days"]
    unless: [view_04531.id, view_04531.status]
  }

  join: view_04533 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04531.user_id} = ${view_04533.id} ;;
    required_joins: []
  }

  join: view_04534 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04531.account_id} = ${view_04534.account_id} ;;
    required_joins: [view_04533]
  }

  join: view_04535 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04531.category} = ${view_04535.category} ;;
  }

  access_filter: {
    field: view_04531.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04531.is_deleted} = false ;;
}

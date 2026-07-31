# Update for 2000 file diff target
# Explore: explore_3459
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10378.view.lkml"
include: "/views/domain_30/view_10380.view.lkml"
include: "/views/domain_31/view_10381.view.lkml"
include: "/views/domain_32/view_10382.view.lkml"

explore: explore_3459 {
  label: "Explore Explore 3459"
  description: "Comprehensive analytics explore joining base view_10378 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10378
  
  always_filter: {
    filters: [view_10378.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10378.created_at_date: "7 days"]
    unless: [view_10378.id, view_10378.status]
  }

  join: view_10380 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10378.user_id} = ${view_10380.id} ;;
    required_joins: []
  }

  join: view_10381 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10378.account_id} = ${view_10381.account_id} ;;
    required_joins: [view_10380]
  }

  join: view_10382 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10378.category} = ${view_10382.category} ;;
  }

  access_filter: {
    field: view_10378.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10378.is_deleted} = false ;;
}

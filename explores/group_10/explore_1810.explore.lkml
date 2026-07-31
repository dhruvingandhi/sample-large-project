# Update for 2000 file diff target
# Explore: explore_1810
# Auto-generated LookML Explore File

include: "/views/domain_31/view_05431.view.lkml"
include: "/views/domain_33/view_05433.view.lkml"
include: "/views/domain_34/view_05434.view.lkml"
include: "/views/domain_35/view_05435.view.lkml"

explore: explore_1810 {
  label: "Explore Explore 1810"
  description: "Comprehensive analytics explore joining base view_05431 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05431
  
  always_filter: {
    filters: [view_05431.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05431.created_at_date: "7 days"]
    unless: [view_05431.id, view_05431.status]
  }

  join: view_05433 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05431.user_id} = ${view_05433.id} ;;
    required_joins: []
  }

  join: view_05434 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05431.account_id} = ${view_05434.account_id} ;;
    required_joins: [view_05433]
  }

  join: view_05435 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05431.category} = ${view_05435.category} ;;
  }

  access_filter: {
    field: view_05431.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05431.is_deleted} = false ;;
}

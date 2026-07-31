# Update for 2000 file diff target
# Explore: explore_3480
# Auto-generated LookML Explore File

include: "/views/domain_41/view_10441.view.lkml"
include: "/views/domain_43/view_10443.view.lkml"
include: "/views/domain_44/view_10444.view.lkml"
include: "/views/domain_45/view_10445.view.lkml"

explore: explore_3480 {
  label: "Explore Explore 3480"
  description: "Comprehensive analytics explore joining base view_10441 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10441
  
  always_filter: {
    filters: [view_10441.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10441.created_at_date: "7 days"]
    unless: [view_10441.id, view_10441.status]
  }

  join: view_10443 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10441.user_id} = ${view_10443.id} ;;
    required_joins: []
  }

  join: view_10444 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10441.account_id} = ${view_10444.account_id} ;;
    required_joins: [view_10443]
  }

  join: view_10445 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10441.category} = ${view_10445.category} ;;
  }

  access_filter: {
    field: view_10441.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10441.is_deleted} = false ;;
}

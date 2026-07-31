# Update for 2000 file diff target
# Explore: explore_2890
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08671.view.lkml"
include: "/views/domain_23/view_08673.view.lkml"
include: "/views/domain_24/view_08674.view.lkml"
include: "/views/domain_25/view_08675.view.lkml"

explore: explore_2890 {
  label: "Explore Explore 2890"
  description: "Comprehensive analytics explore joining base view_08671 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08671
  
  always_filter: {
    filters: [view_08671.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08671.created_at_date: "7 days"]
    unless: [view_08671.id, view_08671.status]
  }

  join: view_08673 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08671.user_id} = ${view_08673.id} ;;
    required_joins: []
  }

  join: view_08674 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08671.account_id} = ${view_08674.account_id} ;;
    required_joins: [view_08673]
  }

  join: view_08675 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08671.category} = ${view_08675.category} ;;
  }

  access_filter: {
    field: view_08671.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08671.is_deleted} = false ;;
}

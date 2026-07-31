# Update for 2000 file diff target
# Explore: explore_2680
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08041.view.lkml"
include: "/views/domain_43/view_08043.view.lkml"
include: "/views/domain_44/view_08044.view.lkml"
include: "/views/domain_45/view_08045.view.lkml"

explore: explore_2680 {
  label: "Explore Explore 2680"
  description: "Comprehensive analytics explore joining base view_08041 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08041
  
  always_filter: {
    filters: [view_08041.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08041.created_at_date: "7 days"]
    unless: [view_08041.id, view_08041.status]
  }

  join: view_08043 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08041.user_id} = ${view_08043.id} ;;
    required_joins: []
  }

  join: view_08044 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08041.account_id} = ${view_08044.account_id} ;;
    required_joins: [view_08043]
  }

  join: view_08045 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08041.category} = ${view_08045.category} ;;
  }

  access_filter: {
    field: view_08041.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08041.is_deleted} = false ;;
}

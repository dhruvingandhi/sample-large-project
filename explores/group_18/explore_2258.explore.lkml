# Update for 2000 file diff target
# Explore: explore_2258
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06775.view.lkml"
include: "/views/domain_27/view_06777.view.lkml"
include: "/views/domain_28/view_06778.view.lkml"
include: "/views/domain_29/view_06779.view.lkml"

explore: explore_2258 {
  label: "Explore Explore 2258"
  description: "Comprehensive analytics explore joining base view_06775 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06775
  
  always_filter: {
    filters: [view_06775.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06775.created_at_date: "7 days"]
    unless: [view_06775.id, view_06775.status]
  }

  join: view_06777 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06775.user_id} = ${view_06777.id} ;;
    required_joins: []
  }

  join: view_06778 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06775.account_id} = ${view_06778.account_id} ;;
    required_joins: [view_06777]
  }

  join: view_06779 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06775.category} = ${view_06779.category} ;;
  }

  access_filter: {
    field: view_06775.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06775.is_deleted} = false ;;
}

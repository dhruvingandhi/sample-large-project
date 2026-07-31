# Update for 2000 file diff target
# Explore: explore_2230
# Auto-generated LookML Explore File

include: "/views/domain_41/view_06691.view.lkml"
include: "/views/domain_43/view_06693.view.lkml"
include: "/views/domain_44/view_06694.view.lkml"
include: "/views/domain_45/view_06695.view.lkml"

explore: explore_2230 {
  label: "Explore Explore 2230"
  description: "Comprehensive analytics explore joining base view_06691 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06691
  
  always_filter: {
    filters: [view_06691.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06691.created_at_date: "7 days"]
    unless: [view_06691.id, view_06691.status]
  }

  join: view_06693 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06691.user_id} = ${view_06693.id} ;;
    required_joins: []
  }

  join: view_06694 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06691.account_id} = ${view_06694.account_id} ;;
    required_joins: [view_06693]
  }

  join: view_06695 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06691.category} = ${view_06695.category} ;;
  }

  access_filter: {
    field: view_06691.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06691.is_deleted} = false ;;
}

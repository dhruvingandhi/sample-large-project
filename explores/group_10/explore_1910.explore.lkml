# Update for 2000 file diff target
# Explore: explore_1910
# Auto-generated LookML Explore File

include: "/views/domain_31/view_05731.view.lkml"
include: "/views/domain_33/view_05733.view.lkml"
include: "/views/domain_34/view_05734.view.lkml"
include: "/views/domain_35/view_05735.view.lkml"

explore: explore_1910 {
  label: "Explore Explore 1910"
  description: "Comprehensive analytics explore joining base view_05731 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05731
  
  always_filter: {
    filters: [view_05731.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05731.created_at_date: "7 days"]
    unless: [view_05731.id, view_05731.status]
  }

  join: view_05733 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05731.user_id} = ${view_05733.id} ;;
    required_joins: []
  }

  join: view_05734 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05731.account_id} = ${view_05734.account_id} ;;
    required_joins: [view_05733]
  }

  join: view_05735 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05731.category} = ${view_05735.category} ;;
  }

  access_filter: {
    field: view_05731.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05731.is_deleted} = false ;;
}

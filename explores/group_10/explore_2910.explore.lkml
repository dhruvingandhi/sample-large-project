# Update for 2000 file diff target
# Explore: explore_2910
# Auto-generated LookML Explore File

include: "/views/domain_31/view_08731.view.lkml"
include: "/views/domain_33/view_08733.view.lkml"
include: "/views/domain_34/view_08734.view.lkml"
include: "/views/domain_35/view_08735.view.lkml"

explore: explore_2910 {
  label: "Explore Explore 2910"
  description: "Comprehensive analytics explore joining base view_08731 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08731
  
  always_filter: {
    filters: [view_08731.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08731.created_at_date: "7 days"]
    unless: [view_08731.id, view_08731.status]
  }

  join: view_08733 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08731.user_id} = ${view_08733.id} ;;
    required_joins: []
  }

  join: view_08734 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08731.account_id} = ${view_08734.account_id} ;;
    required_joins: [view_08733]
  }

  join: view_08735 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08731.category} = ${view_08735.category} ;;
  }

  access_filter: {
    field: view_08731.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08731.is_deleted} = false ;;
}

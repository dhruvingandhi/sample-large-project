# Explore: explore_3876
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11629.view.lkml"
include: "/views/domain_31/view_11631.view.lkml"
include: "/views/domain_32/view_11632.view.lkml"
include: "/views/domain_33/view_11633.view.lkml"

explore: explore_3876 {
  label: "Explore Explore 3876"
  description: "Comprehensive analytics explore joining base view_11629 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11629
  
  always_filter: {
    filters: [view_11629.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11629.created_at_date: "7 days"]
    unless: [view_11629.id, view_11629.status]
  }

  join: view_11631 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11629.user_id} = ${view_11631.id} ;;
    required_joins: []
  }

  join: view_11632 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11629.account_id} = ${view_11632.account_id} ;;
    required_joins: [view_11631]
  }

  join: view_11633 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11629.category} = ${view_11633.category} ;;
  }

  access_filter: {
    field: view_11629.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11629.is_deleted} = false ;;
}

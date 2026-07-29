# Explore: explore_3573
# Auto-generated LookML Explore File

include: "/views/domain_20/view_10720.view.lkml"
include: "/views/domain_22/view_10722.view.lkml"
include: "/views/domain_23/view_10723.view.lkml"
include: "/views/domain_24/view_10724.view.lkml"

explore: explore_3573 {
  label: "Explore Explore 3573"
  description: "Comprehensive analytics explore joining base view_10720 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10720
  
  always_filter: {
    filters: [view_10720.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10720.created_at_date: "7 days"]
    unless: [view_10720.id, view_10720.status]
  }

  join: view_10722 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10720.user_id} = ${view_10722.id} ;;
    required_joins: []
  }

  join: view_10723 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10720.account_id} = ${view_10723.account_id} ;;
    required_joins: [view_10722]
  }

  join: view_10724 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10720.category} = ${view_10724.category} ;;
  }

  access_filter: {
    field: view_10720.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10720.is_deleted} = false ;;
}

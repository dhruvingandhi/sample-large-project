# Explore: explore_1573
# Auto-generated LookML Explore File

include: "/views/domain_20/view_04720.view.lkml"
include: "/views/domain_22/view_04722.view.lkml"
include: "/views/domain_23/view_04723.view.lkml"
include: "/views/domain_24/view_04724.view.lkml"

explore: explore_1573 {
  label: "Explore Explore 1573"
  description: "Comprehensive analytics explore joining base view_04720 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04720
  
  always_filter: {
    filters: [view_04720.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04720.created_at_date: "7 days"]
    unless: [view_04720.id, view_04720.status]
  }

  join: view_04722 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04720.user_id} = ${view_04722.id} ;;
    required_joins: []
  }

  join: view_04723 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04720.account_id} = ${view_04723.account_id} ;;
    required_joins: [view_04722]
  }

  join: view_04724 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04720.category} = ${view_04724.category} ;;
  }

  access_filter: {
    field: view_04720.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04720.is_deleted} = false ;;
}

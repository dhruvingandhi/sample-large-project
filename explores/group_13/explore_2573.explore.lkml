# Explore: explore_2573
# Auto-generated LookML Explore File

include: "/views/domain_20/view_07720.view.lkml"
include: "/views/domain_22/view_07722.view.lkml"
include: "/views/domain_23/view_07723.view.lkml"
include: "/views/domain_24/view_07724.view.lkml"

explore: explore_2573 {
  label: "Explore Explore 2573"
  description: "Comprehensive analytics explore joining base view_07720 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07720
  
  always_filter: {
    filters: [view_07720.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07720.created_at_date: "7 days"]
    unless: [view_07720.id, view_07720.status]
  }

  join: view_07722 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07720.user_id} = ${view_07722.id} ;;
    required_joins: []
  }

  join: view_07723 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07720.account_id} = ${view_07723.account_id} ;;
    required_joins: [view_07722]
  }

  join: view_07724 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07720.category} = ${view_07724.category} ;;
  }

  access_filter: {
    field: view_07720.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07720.is_deleted} = false ;;
}

# Explore: explore_3557
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10672.view.lkml"
include: "/views/domain_24/view_10674.view.lkml"
include: "/views/domain_25/view_10675.view.lkml"
include: "/views/domain_26/view_10676.view.lkml"

explore: explore_3557 {
  label: "Explore Explore 3557"
  description: "Comprehensive analytics explore joining base view_10672 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10672
  
  always_filter: {
    filters: [view_10672.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10672.created_at_date: "7 days"]
    unless: [view_10672.id, view_10672.status]
  }

  join: view_10674 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10672.user_id} = ${view_10674.id} ;;
    required_joins: []
  }

  join: view_10675 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10672.account_id} = ${view_10675.account_id} ;;
    required_joins: [view_10674]
  }

  join: view_10676 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10672.category} = ${view_10676.category} ;;
  }

  access_filter: {
    field: view_10672.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10672.is_deleted} = false ;;
}

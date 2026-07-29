# Explore: explore_3881
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11644.view.lkml"
include: "/views/domain_46/view_11646.view.lkml"
include: "/views/domain_47/view_11647.view.lkml"
include: "/views/domain_48/view_11648.view.lkml"

explore: explore_3881 {
  label: "Explore Explore 3881"
  description: "Comprehensive analytics explore joining base view_11644 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11644
  
  always_filter: {
    filters: [view_11644.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11644.created_at_date: "7 days"]
    unless: [view_11644.id, view_11644.status]
  }

  join: view_11646 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11644.user_id} = ${view_11646.id} ;;
    required_joins: []
  }

  join: view_11647 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11644.account_id} = ${view_11647.account_id} ;;
    required_joins: [view_11646]
  }

  join: view_11648 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11644.category} = ${view_11648.category} ;;
  }

  access_filter: {
    field: view_11644.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11644.is_deleted} = false ;;
}

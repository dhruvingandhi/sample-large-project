# Explore: explore_0859
# Auto-generated LookML Explore File

include: "/views/domain_28/view_02578.view.lkml"
include: "/views/domain_30/view_02580.view.lkml"
include: "/views/domain_31/view_02581.view.lkml"
include: "/views/domain_32/view_02582.view.lkml"

explore: explore_0859 {
  label: "Explore Explore 0859"
  description: "Comprehensive analytics explore joining base view_02578 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02578
  
  always_filter: {
    filters: [view_02578.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02578.created_at_date: "7 days"]
    unless: [view_02578.id, view_02578.status]
  }

  join: view_02580 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02578.user_id} = ${view_02580.id} ;;
    required_joins: []
  }

  join: view_02581 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02578.account_id} = ${view_02581.account_id} ;;
    required_joins: [view_02580]
  }

  join: view_02582 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02578.category} = ${view_02582.category} ;;
  }

  access_filter: {
    field: view_02578.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02578.is_deleted} = false ;;
}

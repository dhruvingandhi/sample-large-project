# Explore: explore_1911
# Auto-generated LookML Explore File

include: "/views/domain_34/view_05734.view.lkml"
include: "/views/domain_36/view_05736.view.lkml"
include: "/views/domain_37/view_05737.view.lkml"
include: "/views/domain_38/view_05738.view.lkml"

explore: explore_1911 {
  label: "Explore Explore 1911"
  description: "Comprehensive analytics explore joining base view_05734 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05734
  
  always_filter: {
    filters: [view_05734.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05734.created_at_date: "7 days"]
    unless: [view_05734.id, view_05734.status]
  }

  join: view_05736 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05734.user_id} = ${view_05736.id} ;;
    required_joins: []
  }

  join: view_05737 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05734.account_id} = ${view_05737.account_id} ;;
    required_joins: [view_05736]
  }

  join: view_05738 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05734.category} = ${view_05738.category} ;;
  }

  access_filter: {
    field: view_05734.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05734.is_deleted} = false ;;
}

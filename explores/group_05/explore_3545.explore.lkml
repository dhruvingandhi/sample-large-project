# Explore: explore_3545
# Auto-generated LookML Explore File

include: "/views/domain_36/view_10636.view.lkml"
include: "/views/domain_38/view_10638.view.lkml"
include: "/views/domain_39/view_10639.view.lkml"
include: "/views/domain_40/view_10640.view.lkml"

explore: explore_3545 {
  label: "Explore Explore 3545"
  description: "Comprehensive analytics explore joining base view_10636 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10636
  
  always_filter: {
    filters: [view_10636.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10636.created_at_date: "7 days"]
    unless: [view_10636.id, view_10636.status]
  }

  join: view_10638 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10636.user_id} = ${view_10638.id} ;;
    required_joins: []
  }

  join: view_10639 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10636.account_id} = ${view_10639.account_id} ;;
    required_joins: [view_10638]
  }

  join: view_10640 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10636.category} = ${view_10640.category} ;;
  }

  access_filter: {
    field: view_10636.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10636.is_deleted} = false ;;
}

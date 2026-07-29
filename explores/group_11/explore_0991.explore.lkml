# Explore: explore_0991
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02974.view.lkml"
include: "/views/domain_26/view_02976.view.lkml"
include: "/views/domain_27/view_02977.view.lkml"
include: "/views/domain_28/view_02978.view.lkml"

explore: explore_0991 {
  label: "Explore Explore 0991"
  description: "Comprehensive analytics explore joining base view_02974 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02974
  
  always_filter: {
    filters: [view_02974.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02974.created_at_date: "7 days"]
    unless: [view_02974.id, view_02974.status]
  }

  join: view_02976 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02974.user_id} = ${view_02976.id} ;;
    required_joins: []
  }

  join: view_02977 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02974.account_id} = ${view_02977.account_id} ;;
    required_joins: [view_02976]
  }

  join: view_02978 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02974.category} = ${view_02978.category} ;;
  }

  access_filter: {
    field: view_02974.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02974.is_deleted} = false ;;
}

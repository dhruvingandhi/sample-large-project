# Explore: explore_0912
# Auto-generated LookML Explore File

include: "/views/domain_37/view_02737.view.lkml"
include: "/views/domain_39/view_02739.view.lkml"
include: "/views/domain_40/view_02740.view.lkml"
include: "/views/domain_41/view_02741.view.lkml"

explore: explore_0912 {
  label: "Explore Explore 0912"
  description: "Comprehensive analytics explore joining base view_02737 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02737
  
  always_filter: {
    filters: [view_02737.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02737.created_at_date: "7 days"]
    unless: [view_02737.id, view_02737.status]
  }

  join: view_02739 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02737.user_id} = ${view_02739.id} ;;
    required_joins: []
  }

  join: view_02740 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02737.account_id} = ${view_02740.account_id} ;;
    required_joins: [view_02739]
  }

  join: view_02741 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02737.category} = ${view_02741.category} ;;
  }

  access_filter: {
    field: view_02737.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02737.is_deleted} = false ;;
}

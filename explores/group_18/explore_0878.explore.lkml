# Explore: explore_0878
# Auto-generated LookML Explore File

include: "/views/domain_35/view_02635.view.lkml"
include: "/views/domain_37/view_02637.view.lkml"
include: "/views/domain_38/view_02638.view.lkml"
include: "/views/domain_39/view_02639.view.lkml"

explore: explore_0878 {
  label: "Explore Explore 0878"
  description: "Comprehensive analytics explore joining base view_02635 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02635
  
  always_filter: {
    filters: [view_02635.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02635.created_at_date: "7 days"]
    unless: [view_02635.id, view_02635.status]
  }

  join: view_02637 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02635.user_id} = ${view_02637.id} ;;
    required_joins: []
  }

  join: view_02638 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02635.account_id} = ${view_02638.account_id} ;;
    required_joins: [view_02637]
  }

  join: view_02639 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02635.category} = ${view_02639.category} ;;
  }

  access_filter: {
    field: view_02635.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02635.is_deleted} = false ;;
}

# Explore: explore_2912
# Auto-generated LookML Explore File

include: "/views/domain_37/view_08737.view.lkml"
include: "/views/domain_39/view_08739.view.lkml"
include: "/views/domain_40/view_08740.view.lkml"
include: "/views/domain_41/view_08741.view.lkml"

explore: explore_2912 {
  label: "Explore Explore 2912"
  description: "Comprehensive analytics explore joining base view_08737 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08737
  
  always_filter: {
    filters: [view_08737.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08737.created_at_date: "7 days"]
    unless: [view_08737.id, view_08737.status]
  }

  join: view_08739 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08737.user_id} = ${view_08739.id} ;;
    required_joins: []
  }

  join: view_08740 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08737.account_id} = ${view_08740.account_id} ;;
    required_joins: [view_08739]
  }

  join: view_08741 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08737.category} = ${view_08741.category} ;;
  }

  access_filter: {
    field: view_08737.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08737.is_deleted} = false ;;
}

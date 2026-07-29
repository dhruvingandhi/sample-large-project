# Explore: explore_2715
# Auto-generated LookML Explore File

include: "/views/domain_46/view_08146.view.lkml"
include: "/views/domain_48/view_08148.view.lkml"
include: "/views/domain_49/view_08149.view.lkml"
include: "/views/domain_50/view_08150.view.lkml"

explore: explore_2715 {
  label: "Explore Explore 2715"
  description: "Comprehensive analytics explore joining base view_08146 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08146
  
  always_filter: {
    filters: [view_08146.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08146.created_at_date: "7 days"]
    unless: [view_08146.id, view_08146.status]
  }

  join: view_08148 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08146.user_id} = ${view_08148.id} ;;
    required_joins: []
  }

  join: view_08149 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08146.account_id} = ${view_08149.account_id} ;;
    required_joins: [view_08148]
  }

  join: view_08150 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08146.category} = ${view_08150.category} ;;
  }

  access_filter: {
    field: view_08146.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08146.is_deleted} = false ;;
}

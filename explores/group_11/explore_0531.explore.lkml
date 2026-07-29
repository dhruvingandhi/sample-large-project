# Explore: explore_0531
# Auto-generated LookML Explore File

include: "/views/domain_44/view_01594.view.lkml"
include: "/views/domain_46/view_01596.view.lkml"
include: "/views/domain_47/view_01597.view.lkml"
include: "/views/domain_48/view_01598.view.lkml"

explore: explore_0531 {
  label: "Explore Explore 0531"
  description: "Comprehensive analytics explore joining base view_01594 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01594
  
  always_filter: {
    filters: [view_01594.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01594.created_at_date: "7 days"]
    unless: [view_01594.id, view_01594.status]
  }

  join: view_01596 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01594.user_id} = ${view_01596.id} ;;
    required_joins: []
  }

  join: view_01597 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01594.account_id} = ${view_01597.account_id} ;;
    required_joins: [view_01596]
  }

  join: view_01598 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01594.category} = ${view_01598.category} ;;
  }

  access_filter: {
    field: view_01594.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01594.is_deleted} = false ;;
}

# Explore: explore_0616
# Auto-generated LookML Explore File

include: "/views/domain_49/view_01849.view.lkml"
include: "/views/domain_01/view_01851.view.lkml"
include: "/views/domain_02/view_01852.view.lkml"
include: "/views/domain_03/view_01853.view.lkml"

explore: explore_0616 {
  label: "Explore Explore 0616"
  description: "Comprehensive analytics explore joining base view_01849 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01849
  
  always_filter: {
    filters: [view_01849.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01849.created_at_date: "7 days"]
    unless: [view_01849.id, view_01849.status]
  }

  join: view_01851 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01849.user_id} = ${view_01851.id} ;;
    required_joins: []
  }

  join: view_01852 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01849.account_id} = ${view_01852.account_id} ;;
    required_joins: [view_01851]
  }

  join: view_01853 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01849.category} = ${view_01853.category} ;;
  }

  access_filter: {
    field: view_01849.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01849.is_deleted} = false ;;
}

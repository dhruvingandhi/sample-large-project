# Explore: explore_2717
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08152.view.lkml"
include: "/views/domain_04/view_08154.view.lkml"
include: "/views/domain_05/view_08155.view.lkml"
include: "/views/domain_06/view_08156.view.lkml"

explore: explore_2717 {
  label: "Explore Explore 2717"
  description: "Comprehensive analytics explore joining base view_08152 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08152
  
  always_filter: {
    filters: [view_08152.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08152.created_at_date: "7 days"]
    unless: [view_08152.id, view_08152.status]
  }

  join: view_08154 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08152.user_id} = ${view_08154.id} ;;
    required_joins: []
  }

  join: view_08155 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08152.account_id} = ${view_08155.account_id} ;;
    required_joins: [view_08154]
  }

  join: view_08156 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08152.category} = ${view_08156.category} ;;
  }

  access_filter: {
    field: view_08152.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08152.is_deleted} = false ;;
}

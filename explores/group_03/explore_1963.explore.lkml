# Explore: explore_1963
# Auto-generated LookML Explore File

include: "/views/domain_40/view_05890.view.lkml"
include: "/views/domain_42/view_05892.view.lkml"
include: "/views/domain_43/view_05893.view.lkml"
include: "/views/domain_44/view_05894.view.lkml"

explore: explore_1963 {
  label: "Explore Explore 1963"
  description: "Comprehensive analytics explore joining base view_05890 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05890
  
  always_filter: {
    filters: [view_05890.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05890.created_at_date: "7 days"]
    unless: [view_05890.id, view_05890.status]
  }

  join: view_05892 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05890.user_id} = ${view_05892.id} ;;
    required_joins: []
  }

  join: view_05893 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05890.account_id} = ${view_05893.account_id} ;;
    required_joins: [view_05892]
  }

  join: view_05894 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05890.category} = ${view_05894.category} ;;
  }

  access_filter: {
    field: view_05890.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05890.is_deleted} = false ;;
}

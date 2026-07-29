# Explore: explore_3644
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10933.view.lkml"
include: "/views/domain_35/view_10935.view.lkml"
include: "/views/domain_36/view_10936.view.lkml"
include: "/views/domain_37/view_10937.view.lkml"

explore: explore_3644 {
  label: "Explore Explore 3644"
  description: "Comprehensive analytics explore joining base view_10933 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10933
  
  always_filter: {
    filters: [view_10933.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10933.created_at_date: "7 days"]
    unless: [view_10933.id, view_10933.status]
  }

  join: view_10935 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10933.user_id} = ${view_10935.id} ;;
    required_joins: []
  }

  join: view_10936 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10933.account_id} = ${view_10936.account_id} ;;
    required_joins: [view_10935]
  }

  join: view_10937 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10933.category} = ${view_10937.category} ;;
  }

  access_filter: {
    field: view_10933.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10933.is_deleted} = false ;;
}
